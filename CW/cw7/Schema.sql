CREATE SCHEMA WSEVdata;
USE WSEVdata;
#DROP schema WSEVdata;

CREATE TABLE  Location(  
    PostalCode	char(5),
    County	VARCHAR(100),
    City	VARCHAR(100),
    State	VARCHAR(100),
    Primary key (PostalCode)
);
CREATE TABLE  modeldetails(
    Make	VARCHAR(100),
    Model	VARCHAR(100),
    EVType	VARCHAR(200),
	Primary key (Make, Model)
);
CREATE TABLE Inventory (       
    VehicleID	INT,
    VIN	VARCHAR(100),
    PostalCode	char(5),
    ModelYear	INT,
    Make	VARCHAR(100),
    Model	VARCHAR(100),
    ElectricRange	INT,
    LegislativeDistrict	varchar(100),
    ElectricUtility	VARCHAR(200),
    Primary key (VehicleID),
   Foreign key (PostalCode) references Location(PostalCode),
   Foreign key (make,model) references modeldetails(make, model)
);



