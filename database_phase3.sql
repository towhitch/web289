
-- tables
-- Table: Job_Postings
CREATE TABLE Job_Postings (
    ID_job_posting int NOT NULL,
    Position char(50) NOT NULL,
    Description varchar(500) NOT NULL,
    User_job_postings_ID_user_job_postings int NOT NULL,
    Restaurant_ID_restaurant int NOT NULL,
    CONSTRAINT Job_Postings_pk PRIMARY KEY (ID_job_posting)
);

-- Table: Restaurant
CREATE TABLE Restaurant (
    ID_restaurant int NOT NULL AUTO_INCREMENT,
    Name_restaurant char(100) NOT NULL,
    Address_restaurant char(255) NOT NULL,
    Users_ID_user int NOT NULL,
    CONSTRAINT Restaurant_pk PRIMARY KEY (ID_restaurant)
);

-- Table: Tips_user
CREATE TABLE Tips_user (
    ID_tips int NOT NULL AUTO_INCREMENT,
    Tip_amount numeric(10,2) NOT NULL,
    Date_tip date NOT NULL,
    Hours_worked numeric(10,2) NOT NULL,
    Users_ID_user int NOT NULL,
    Restaurant_ID_restaurant int NOT NULL,
    CONSTRAINT Tips_user_pk PRIMARY KEY (ID_tips)
);

-- Table: User_job_postings
CREATE TABLE User_job_postings (
    ID_user_job_postings int NOT NULL,
    FName_user_job_postings char(20) NOT NULL,
    LName_user_job_postings char(20) NOT NULL,
    Email_user_job_postings char(50) NOT NULL,
    CONSTRAINT ID_user PRIMARY KEY (ID_user_job_postings)
);

-- Table: Users
CREATE TABLE Users (
    ID_user int NOT NULL AUTO_INCREMENT,
    FName_user char(10) NOT NULL,
    LName_user char(10) NOT NULL,
    Email_user char(50) NOT NULL,
    Premium_user bool NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (ID_user)
);

-- foreign keys
-- Reference: Job_Postings_Restaurant (table: Job_Postings)
ALTER TABLE Job_Postings ADD CONSTRAINT Job_Postings_Restaurant FOREIGN KEY Job_Postings_Restaurant (Restaurant_ID_restaurant)
    REFERENCES Restaurant (ID_restaurant);

-- Reference: Job_Postings_User_job_postings (table: Job_Postings)
ALTER TABLE Job_Postings ADD CONSTRAINT Job_Postings_User_job_postings FOREIGN KEY Job_Postings_User_job_postings (User_job_postings_ID_user_job_postings)
    REFERENCES User_job_postings (ID_user_job_postings);

-- Reference: Restaurant_Users (table: Restaurant)
ALTER TABLE Restaurant ADD CONSTRAINT Restaurant_Users FOREIGN KEY Restaurant_Users (Users_ID_user)
    REFERENCES Users (ID_user);

-- Reference: Tips_user_Restaurant (table: Tips_user)
ALTER TABLE Tips_user ADD CONSTRAINT Tips_user_Restaurant FOREIGN KEY Tips_user_Restaurant (Restaurant_ID_restaurant)
    REFERENCES Restaurant (ID_restaurant);

-- Reference: Tips_user_Users (table: Tips_user)
ALTER TABLE Tips_user ADD CONSTRAINT Tips_user_Users FOREIGN KEY Tips_user_Users (Users_ID_user)
    REFERENCES Users (ID_user);

-- End of file.

