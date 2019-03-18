############################################################
#                        ADMIN TABLE                       #
############################################################
############################################################
# id - Database Index                                      #
# user - Username                                          #
# password - Password (sha256 then md5 in uppercase)       #
# email - Email address for password recovery              #
# first name - Admins first name                           #
# last name - Admins last name                             #
############################################################

CREATE TABLE `admin` (

	`id` INT(5) AUTO_INCREMENT NOT NULL,
	`user` VARCHAR(32) NOT NULL,
	`pass` VARCHAR(32) NOT NULL,
	`email` TEXT NOT NULL,
	`fname` VARCHAR(32) NOT NULL,
	`lname` VARCHAR(32) NOT NULL,
	
	PRIMARY KEY (`id`)
);