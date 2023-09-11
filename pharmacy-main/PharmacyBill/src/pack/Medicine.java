package pack;

public class Medicine {
	String medName;
	String batchNo;
	double price;
	String date;

	public Medicine() {

	}

	public Medicine(String medName, String batchNo, double price, String date) {
		super();
		this.medName = medName;
		this.batchNo = batchNo;
		this.price = price;
		this.date = date;
	}

	public String getMedName() {
		return medName;
	}

	public void setMedName(String medName) {
		this.medName = medName;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
