DROP TABLE IF EXISTS language;
DROP TABLE IF EXISTS snippet;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS issue;

#------------------------------------------------------------
# Table: language
#------------------------------------------------------------
CREATE TABLE language(
        id INT AUTO_INCREMENT NOT NULL UNIQUE,
        name VARCHAR(255) NOT NULL,
        created_at DATETIME NOT NULL DEFAULT NOW(),
        updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT language_PK PRIMARY KEY (id)
) ENGINE = InnoDB;

#------------------------------------------------------------
# Table: snippet
#------------------------------------------------------------
CREATE TABLE snippet(
        id INT AUTO_INCREMENT NOT NULL UNIQUE,
        language_id INT NOT NULL,
        issue_id INT NOT NULL,
        content TEXT NOT NULL,
        created_at DATETIME NOT NULL DEFAULT NOW(),
        updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT snippet_PK PRIMARY KEY (id)
        CONSTRAINT issue_FK FOREIGN KEY (issue_id) REFERENCES language(id)
        CONSTRAINT snippet_FK FOREIGN KEY (language_id) REFERENCES language(id)
) ENGINE = InnoDB;

#------------------------------------------------------------
# Table: category
#------------------------------------------------------------
CREATE TABLE category(
        id INT AUTO_INCREMENT NOT NULL UNIQUE,
        libelle VARCHAR (50) NOT NULL,
        sort_order INT,
        color VARCHAR (7) NOT NULL UNIQUE DEFAULT '#000000',
        is_quick_access BOOLEAN NOT NULL DEFAULT 0,
        created_at DATETIME NOT NULL DEFAULT NOW(),
        updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT category_PK PRIMARY KEY (id)
) ENGINE = InnoDB;

#------------------------------------------------------------
# Table: issue
#------------------------------------------------------------
CREATE TABLE issue(
        id INT AUTO_INCREMENT NOT NULL UNIQUE,
        title VARCHAR(255) NOT NULL,
        description TEXT NOT NULL,
        created_at DATETIME NOT NULL DEFAULT NOW(),
        updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT issue_PK PRIMARY KEY (id)
) ENGINE = InnoDB;



issue categorie