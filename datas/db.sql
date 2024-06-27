CREATE TABLE `user` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  is_admin BOOL NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE `recipe` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(40) NOT NULL,
  nb_people INT UNSIGNED NOT NULL,
  image_url VARCHAR(255),
  preparation_time INT UNSIGNED NOT NULL,
  cooking_time INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE `sub_recipe` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  recipe_id INT UNSIGNED NOT NULL,
  title VARCHAR(40) NOT NULL,
  image_url VARCHAR(255),
  duration SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `instruction` (
  id INT UNSIGNED AUTO_INCREMENT,
  sub_recipe_id INT UNSIGNED NOT NULL,
  image_url VARCHAR(255),
  instruction_number TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (sub_recipe_id) REFERENCES sub_recipe(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ingredient` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ingredient TINYTEXT NOT NULL UNIQUE,
  image_url VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE `ingredient_unity` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  unit TINYTEXT NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE `ingredient_has_recipe` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  recipe_id INT UNSIGNED NOT NULL,
  ingredient_id INT UNSIGNED NOT NULL,
  ingredient_unity_id INT UNSIGNED,
  quantity TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (ingredient_id) REFERENCES ingredient(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (ingredient_unity_id) REFERENCES ingredient_unity(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `comment` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  recipe_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  comment TEXT NOT NULL,
  created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  stars TINYINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT CHK_Stars CHECK ( stars >= 1 AND stars <= 5 )
);

CREATE TABLE `category` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category TINYTEXT NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE `recipe_has_category` (
  recipe_id INT UNSIGNED NOT NULL,
  category_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE ON UPDATE CASCADE
);