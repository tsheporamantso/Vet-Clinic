/* Day 1 used queries. */
CREATE TABLE animals ( id BIGSERIAL NOT NULL PRIMARY KEY,
                                                     name VARCHAR(255) NOT NULL,
                                                                       date_of_birth DATE NOT NULL,
                                                                                          escape_attempt INTEGER DEFAULT 0,
                                                                                                                         neutered BOOLEAN DEFAULT FALSE,
                                                                                                                                                  weight_kg DECIMAL(5,2) NOT NULL);

