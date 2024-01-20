//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class RestContactParse {

	public class Geo {
		public String lat;
		public String lng;
	}

	public class Company {
		public String name;
		public String catchPhrase;
		public String bs;
	}

	public Integer id;
	public String name;
	public String username;
	public String email;
	public Address address;
	public String phone;
	public String website;
	public Company company;

	public class Address {
		public String street;
		public String suite;
		public String city;
		public String zipcode;
		public Geo geo;
	}

	
	public static RestContactParse parse(String json) {
		return (RestContactParse) System.JSON.deserialize(json, RestContactParse.class);
	}
}