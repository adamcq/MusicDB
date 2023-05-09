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

package se.kth.iv1351.sgms.model;

/**
 * An account in the bank.
 */
public class Instrument implements InstrumentDTO {
    private String rentalInstrumentId;
    private String instrument;
    private String brand;
    private String category;
    private String fee;


    public Instrument(String rentalInstrumentId, String instrument, String brand, String category, String fee) {
        this.rentalInstrumentId = rentalInstrumentId;
        this.instrument = instrument;
        this.brand = brand;
        this.category = category;
        this.fee = fee;
    }

    public String getRentalInstrumentId() {
        return rentalInstrumentId;
    }

    public String getInstrument() {
        return instrument;
    }

    public String getBrand() {
        return brand;
    }

    public String getCategory() {
        return category;
    }

    public String getFee() {
        return fee;
    }

    /**
     * @return A string representation of all fields in this object.
     */
    @Override
    public String toString() {
        StringBuilder stringRepresentation = new StringBuilder();
        stringRepresentation.append("[");
        stringRepresentation.append("id: ");
        stringRepresentation.append(rentalInstrumentId);
        stringRepresentation.append(", instrument: ");
        stringRepresentation.append(instrument);
        stringRepresentation.append(", brand: ");
        stringRepresentation.append(brand);
        stringRepresentation.append(", fee: ");
        stringRepresentation.append(fee);
        stringRepresentation.append("]");
        return stringRepresentation.toString();
    }
}

