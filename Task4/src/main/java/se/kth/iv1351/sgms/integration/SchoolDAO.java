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
// HEEEEEEy
package se.kth.iv1351.sgms.integration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import se.kth.iv1351.sgms.model.Instrument;
import se.kth.iv1351.sgms.model.RentalAgreement;

/**
 * This data access object (DAO) encapsulates all database calls in the bank
 * application. No code outside this class shall have any knowledge about the
 * database.
 */
public class SchoolDAO {
    private static final String INSTRUMENT_FEE_COLUMN_NAME = "fee";
    private static final String INSTRUMENT_INSTRUMENT_COLUMN_NAME = "instrument";
    private static final String INSTRUMENT_PK_COLUMN_NAME = "rental_instrument_id";
    private static final String INSTRUMENT_BRAND_COLUMN_NAME = "brand";
    private static final String INSTRUMENT_CATEGORY_COLUMN_NAME = "category";

    private Connection connection;

    private PreparedStatement findInstrumentsByTypeStmt;
    private PreparedStatement findAllInstrumentsStmt;
    private PreparedStatement findStudentIdByPersonalNumberStmt;
    private PreparedStatement findNofActiveRentalsForStudentStmt;
    private PreparedStatement createRentalAgreementStmt;
    private PreparedStatement findAllActiveAgreementsStmt;
    private PreparedStatement terminateRentalStmt;
    private PreparedStatement lockRentalForUpdateStmt;

    public SchoolDAO() throws SchoolDBException {
        try {
            connectToSgmsDB();
            prepareStatements();
        } catch (ClassNotFoundException | SQLException exception) {
            throw new SchoolDBException("Could not connect to datasource.", exception);
        }
    }
    public void commit() throws SchoolDBException {
        try {
            connection.commit();
        } catch (SQLException e) {
            handleException("Failed to commit", e);
        }
    }

    private void connectToSgmsDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/sgms",
                                                 "postgres", "postgres");
        connection.setAutoCommit(false);
    }

    public List<Instrument> readInstrumentsByType(String instrument) throws SchoolDBException {
        String failureMsg = "Could not search for specified instruments.";
        ResultSet result = null;
        List<Instrument> instruments = new ArrayList<>();
        try {
            findInstrumentsByTypeStmt.setString(1, instrument);
            result = findInstrumentsByTypeStmt.executeQuery();
            while (result.next()) {
                instruments.add( new Instrument(result.getString(INSTRUMENT_PK_COLUMN_NAME),result.getString(INSTRUMENT_INSTRUMENT_COLUMN_NAME), result.getString(INSTRUMENT_BRAND_COLUMN_NAME), result.getString(INSTRUMENT_CATEGORY_COLUMN_NAME), result.getString(INSTRUMENT_FEE_COLUMN_NAME)));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            closeResultSet(failureMsg, result);
        }
        return instruments;
    }

    public List<Instrument> readAllInstruments() throws SchoolDBException {
        String failureMsg = "Could not list all instruments.";
        List<Instrument> instruments = new ArrayList<>();
        try (ResultSet result = findAllInstrumentsStmt.executeQuery()) {
            while (result.next()) {
                instruments.add( new Instrument(result.getString(INSTRUMENT_PK_COLUMN_NAME),result.getString(INSTRUMENT_INSTRUMENT_COLUMN_NAME), result.getString(INSTRUMENT_BRAND_COLUMN_NAME), result.getString(INSTRUMENT_CATEGORY_COLUMN_NAME), result.getString(INSTRUMENT_FEE_COLUMN_NAME)));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
        return instruments;
    }

    public String readStudentIdByPersonalNumber(String studentPersonalNumber) throws SchoolDBException {
        String failureMsg = "Could not find student by personal number " + studentPersonalNumber;
        ResultSet result = null;
        try {
            findStudentIdByPersonalNumberStmt.setString(1, studentPersonalNumber);
            result = findStudentIdByPersonalNumberStmt.executeQuery();
            if (result.next()) {
                return result.getString("student_id");
            }
        }
        catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            closeResultSet(failureMsg, result);
        }
        return null;
    }

    public Integer readNofActiveRentalsForStudent(String studentId) throws SchoolDBException {
        String failureMsg = "Could not find active rentals for student " + studentId;
        ResultSet result = null;
        try {
            findNofActiveRentalsForStudentStmt.setString(1, studentId);
            result = findNofActiveRentalsForStudentStmt.executeQuery();
            if (result.next()) {
                return result.getInt("nof_active_rentals");
            }
        }
        catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            if (result != null)
                closeResultSet(failureMsg, result);
        }
        return null;
    }

    public void createRentalAgreement(String studentId, String rentalInstrumentId) throws SchoolDBException {
        String failureMsg = "Could not create rental agreement for student " + studentId + " and instrument " + rentalInstrumentId;
        int updatedRows = 0;
        try {
            createRentalAgreementStmt.setString(1, String.valueOf(java.time.LocalDate.now()));
            createRentalAgreementStmt.setString(2, studentId);
            createRentalAgreementStmt.setString(3, rentalInstrumentId);

            updatedRows = createRentalAgreementStmt.executeUpdate();
            if (updatedRows != 1) {
                handleException(failureMsg, null);
            }
        }
        catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
    }

    public List<RentalAgreement> readAllActiveAgreements() throws SchoolDBException {
        String failureMsg = "Could not find all agreements.";
        List<RentalAgreement> rentals = new ArrayList<>();
        try (ResultSet result = findAllActiveAgreementsStmt.executeQuery()) {
            while (result.next()) {
                rentals.add(new RentalAgreement(result.getString("rental_agreement_id"), result.getString("name"), result.getString("personal_number"), result.getString("instrument"), result.getString("brand"), result.getString("fee"), result.getString("date_rented")));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
        return rentals;
    }

    public void updateRentalDateReturned(String rentalId) throws SchoolDBException {
        String failureMsg = "Could not terminate rental agreement: " + rentalId;
        int updatedRows = 0;
        try {
            terminateRentalStmt.setString(1, rentalId);
            updatedRows = terminateRentalStmt.executeUpdate();
            if (updatedRows != 1) {
                handleException(failureMsg, null);
            }
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
    }

    public boolean lockRentalForUpdate(String rentalId) throws SchoolDBException {
        String failureMsg = "Could not lock rental agreement: " + rentalId;
        ResultSet result = null;
        try {
            lockRentalForUpdateStmt.setString(1, rentalId);
            result = lockRentalForUpdateStmt.executeQuery();
            return result.next() && Objects.equals(result.getString("rental_agreement_id"), rentalId);
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
        return false;
    }

    private void prepareStatements() throws SQLException {
        findAllInstrumentsStmt = connection.prepareStatement("SELECT ri.rental_instrument_id , ri.instrument, ri.brand, ri.category, if2.fee FROM rental_instrument ri\n" +
                "FULL JOIN rental_agreement ra\n" +
                "ON ra.rental_instrument_id = ri.rental_instrument_id \n" +
                "FULL JOIN instrument_fee if2 \n" +
                "ON ri.rental_instrument_id = if2.rental_instrument_id\n" +
                "WHERE ra.date_returned IS NOT NULL OR ra.rental_instrument_id IS NULL\n" +
                "ORDER BY instrument, fee");

        findInstrumentsByTypeStmt = connection.prepareStatement("SELECT ri.rental_instrument_id , ri.instrument, ri.brand, ri.category, if2.fee FROM rental_instrument ri\n" +
                "FULL JOIN rental_agreement ra\n" +
                "ON ra.rental_instrument_id = ri.rental_instrument_id \n" +
                "FULL JOIN instrument_fee if2 \n" +
                "ON ri.rental_instrument_id = if2.rental_instrument_id\n" +
                "WHERE (ra.date_returned IS NOT NULL OR ra.rental_instrument_id IS NULL) AND instrument = ?\n" +
                "ORDER BY fee");

        findStudentIdByPersonalNumberStmt = connection.prepareStatement("SELECT * FROM student WHERE personal_number = ?");

        findNofActiveRentalsForStudentStmt = connection.prepareStatement("SELECT s2.student_id, s2.name, COALESCE(nof_active_rentals,0) AS nof_active_rentals\n" +
                "FROM student s2 \n" +
                "LEFT JOIN (SELECT s.student_id, s.name, count(s.student_id) AS nof_active_rentals FROM rental_agreement ra \n" +
                "LEFT JOIN student s \n" +
                "ON ra.student_id = s.student_id \n" +
                "WHERE ra.date_returned IS NULL \n" +
                "GROUP BY s.student_id) AS students_with_rental_agreements \n" +
                "ON students_with_rental_agreements.student_id = s2.student_id \n" +
                "WHERE s2.student_id = (?)::UUID");

        createRentalAgreementStmt = connection.prepareStatement("INSERT INTO rental_agreement"
                + "(date_rented, student_id, rental_instrument_id) VALUES ((?)::DATE, (?)::UUID, (?)::UUID)");

        findAllActiveAgreementsStmt = connection.prepareStatement("SELECT ra.rental_agreement_id, s.name, s.personal_number, ri.instrument, ri.brand , rif.fee, ra.date_rented FROM rental_agreement ra \n" +
                "LEFT JOIN student s \n" +
                "ON ra.student_id = s.student_id\n" +
                "LEFT JOIN rental_instrument ri \n" +
                "ON ri.rental_instrument_id = ra.rental_instrument_id \n" +
                "LEFT JOIN instrument_fee rif \n" +
                "ON rif.rental_instrument_id = ra.rental_instrument_id \n" +
                "WHERE date_returned IS NULL;");

        terminateRentalStmt = connection.prepareStatement("UPDATE rental_agreement\n" +
                "SET date_returned = CURRENT_DATE\n" +
                "WHERE rental_agreement_id = (?)::UUID");

        lockRentalForUpdateStmt = connection.prepareStatement("SELECT rental_agreement_id FROM rental_agreement WHERE rental_agreement_id = (?)::UUID FOR UPDATE;\n");
    }
    private void handleException(String failureMsg, Exception cause) throws SchoolDBException {
        String completeFailureMsg = failureMsg;
        try {
            connection.rollback();
        } catch (SQLException rollbackExc) {
            completeFailureMsg = completeFailureMsg + 
            ". Also failed to rollback transaction because of: " + rollbackExc.getMessage();
        }

        if (cause != null) {
            throw new SchoolDBException(failureMsg, cause);
        } else {
            throw new SchoolDBException(failureMsg);
        }
    }

    private void closeResultSet(String failureMsg, ResultSet result) throws SchoolDBException {
        try {
            result.close();
        } catch (Exception e) {
            throw new SchoolDBException(failureMsg + " Could not close result set.", e);
        }
    }
}