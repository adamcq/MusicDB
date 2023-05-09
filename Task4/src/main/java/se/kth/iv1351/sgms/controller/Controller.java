/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.sgms.controller;

import java.util.ArrayList;
import java.util.List;

import se.kth.iv1351.sgms.integration.SchoolDAO;
import se.kth.iv1351.sgms.integration.SchoolDBException;
import se.kth.iv1351.sgms.model.*;

/**
 * This is the application's only controller, all calls to the model pass here.
 * The controller is also responsible for calling the DAO. Typically, the
 * controller first calls the DAO to retrieve data (if needed), then operates on
 * the data, and finally tells the DAO to store the updated data (if any).
 */
public class Controller {
    private final SchoolDAO schoolDb;

    public Controller() throws SchoolDBException {
        schoolDb = new SchoolDAO();
    }

    public List<? extends InstrumentDTO> getAllInstruments() throws InstrumentException {
        try {
            return schoolDb.readAllInstruments();
        } catch (Exception e) {
            throw new InstrumentException("Unable to list instruments.", e);
        }
    }

    public List<? extends InstrumentDTO> getInstrumentsForType(String instrument) throws InstrumentException {
        if (instrument == null) {
            return new ArrayList<>();
        }
        try {
            return schoolDb.readInstrumentsByType(instrument);
        } catch (Exception e) {
            throw new InstrumentException("Could not search for instrument.", e);
        }
    }

    public String rent(String studentPersonalNumber, String rentalInstrumentId) throws SchoolDBException, InstrumentException {
        String studentId = schoolDb.readStudentIdByPersonalNumber(studentPersonalNumber);
        if (studentId == null)
            return "Student with personal number " + studentPersonalNumber + " does not exist";

        Integer nofActiveRentalsForStudent = schoolDb.readNofActiveRentalsForStudent(studentId);
        if (nofActiveRentalsForStudent >= 2)
            return  "Student with personal number " + studentPersonalNumber + " already has the maximum number of active rentals.";

        schoolDb.createRentalAgreement(studentId, rentalInstrumentId);
        commitOngoingTransaction("Could not create rental agreement for student " + studentId + " and instrument " + rentalInstrumentId);
        return "rental successful";
    }

    public List<? extends RentalAgreementDTO> listActiveAgreements() throws RentalAgreementException {
        try{
            return schoolDb.readAllActiveAgreements();
        } catch (Exception e) {
            throw new RentalAgreementException("Unable to list accounts.", e);
        }
    }

    public String terminate(String rental_agreement_id) throws RentalAgreementException {
        String failureMsg = "Could not terminate rental agreement: " + rental_agreement_id;
        if (rental_agreement_id == null) {
            throw new RentalAgreementException(failureMsg);
        }
        try {
            boolean lockingStatus = schoolDb.lockRentalForUpdate(rental_agreement_id);
            if (!lockingStatus)
                return "Could not find rental agreement";
            schoolDb.updateRentalDateReturned(rental_agreement_id);
            commitOngoingTransaction(failureMsg);
            return "Terminated successfully";
        } catch (Exception e) {
            throw new RentalAgreementException(failureMsg, e);
        }
    }

    private void commitOngoingTransaction(String failureMsg) throws InstrumentException {
        try {
            schoolDb.commit();
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        }
    }

}
