-- This is the control file with in-line data for SQL Loader.
-- Items in <> must be filled in by you.
-- don't forget to edit the (employer_table_columns_here)
-- this should be run in the command prompt, not sqlplus

-- Invoke this load by
-- sqlldr USERID=<user>/<pass> CONTROL=<PATH>/LoadEMPLOYER.ctl LOG=<PATH>/LoadEmployer.log

LOAD DATA
INFILE *
INTO TABLE employer
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(employer_table_columns_here)
BEGINDATA
"Acme Information Source", "Customer Support", "132 Commerical Way", "Cleveland","OH",44234
"Ajax Software, Inc.", "RandD", "2421 West Industrial Way", "Berkeley","CA",94710
"Ajax Software, Inc.", "Production", "2421 West Industrial Way", "Berkeley","CA",94710
"Bay Software Inc.", "Production", "4223 Halster Way", "Berkeley","CA",94710
"Bay Software Inc.", "RandD", "4223 Halster Way", "Berkeley","CA",94710
"Braddock Information Assoc.", "Payroll", "1 Washington Complex","Boston","MA",02101 
"Yankee Software", "Development", "1 Braddock Circle","Kenmore","NY",14223
"Yankee Software", "RandD", "1 Braddock Circle","Kenmore","NY",14223
"Yankee Software", "Management", "1 Braddock Circle","Kenmore","NY",14223
"Buffalo Software Assoc.","Payroll","45511 Delaware Ave.","Buffalo","NY",14221
"Cameron Industries", "Management", "3112 West Helm Street", "Kingwood","TX",77339
"Cameron Industries", "Customer Support", "3112 West Helm Street", "Kingwood","TX",77339
"CCC Software", "Production", "41 Golem Terrace", "New York", "NY",10012
"DC Security Applications","RandD","1602 Jackson Ave.","Arlington","VA",22202
"Davis-Klein Software", "RandD", "8871 West Grange Drive", "Cairo", "NY",12413
"Jersey Computer Services","Customer Support","44 WhiteStallion Pike","Lindenwold","NJ",08021
"Flordia Software Designs", "Development", "45A Sturgeon Dr., Bldg. 5", "Ft. Pierce", "FL",34951
"Flordia Software Designs", "RandD", "45A Sturgeon Dr., Bldg. 5", "Ft. Pierce", "FL",34951
"Focused Applications, Inc.","Production","776 West Ninth St.","Myrtle Beach","SC", 29579
"Georgia Software Design","RandD","6665 Peachtree Lane","Atlanta","GA",30328
"ApplDesign","RandD","3 Mapleview Drive","Huntsville","AL",35803
"Long Island Apps, Inc.","Development","67 Merrifield Ave.","Oceanside","NY",11572
"Manhattan-Made Software","Customer Support","35 West 9th St.","New York","NY",10012
"Manhattan-Made Software","Payroll","35 West 9th St.","New York","NY",10012
"Michigan Application Design","Development","5531 E. Lansing Ave.","Ypsilanti","MI",48197
"Midtown Software Development","Customer Support","7554 West 9th St.","New York","NY",10003
"Mountainside Magic Software","Customer Support","4 Rocky Way","Colorado Springs","CO",80941
"Mountainside Magic Software","Management","4 Rocky Way","Colorado Springs","CO",80941
"Nantucket Applications, Inc.","RandD","45521 Pilgrim Circle","Nantucket","MA",02554
"PennState Programming, Inc.","Management","3 Carnegie Circle","Pittsburgh","PA",15108
"PSWD, Inc.","Management","15 Carnegie Circle","Pittsburgh","PA",15108
"Rochester Software Design","Development","16 Broad Street","Rochester","NY",14621
"Rochester Application Software","Production","16 Broad Street","Rochester","NY",14621
"Sandy Hook Software","Development","5665 MassPike Circle","Sandy Hook","CT",06482
"Vegas Programming and Design","Development","3 Desert Trail","Las Vegas","NV",89117
"Virginia Software Industries","Production","3 Confederate Ave.","Roanoke","VA",24010
"Western New York Applications","RandD","44 Rockman Blvd.","Rochester","NY",14623
