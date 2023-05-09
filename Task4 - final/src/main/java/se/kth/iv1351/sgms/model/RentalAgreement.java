package se.kth.iv1351.sgms.model;

public class RentalAgreement implements RentalAgreementDTO{
    private String rentalAgreementId;
    private String name;
    private String personalNumber;
    private String instrument;
    private String brand;
    private String fee;
    private String dateRented;

    public RentalAgreement(String rentalAgreementId, String name, String personalNumber, String instrument, String brand, String fee, String dateRented) {
        this.rentalAgreementId = rentalAgreementId;
        this.name = name;
        this.personalNumber = personalNumber;
        this.instrument = instrument;
        this.brand = brand;
        this.fee = fee;
        this.dateRented = dateRented;
    }


    public String getRentalAgreementId() {
        return rentalAgreementId;
    }

    public String getName() {
        return name;
    }

    public String getPersonalNumber() {
        return personalNumber;
    }

    public String getInstrument() {
        return instrument;
    }

    public String getBrand() {
        return brand;
    }

    public String getFee() {
        return fee;
    }

    public String getDateRented() {
        return dateRented;
    }

    @Override
    public String toString() {
        return "[rental_id: " + rentalAgreementId  +
                ", student: " + name +
                ", pn: " + personalNumber +
                ", instrument: " + instrument +
                " " + brand +
                ", fee: " + fee +
                ", since: " + dateRented +
                ']';
    }
}
