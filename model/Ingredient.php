<?php
class Ingredient{
  private int $id;
  private int $quantity;
  private string $unity;
  private string $name;
  private ?string $img_url;

  public function __construct(int $id, int $quantity, string $unity, string $name, ?string $img_url) {
    $this->id = $id;
    $this->setQuantity($quantity);
    $this->setUnity($unity);
    $this->setName($name);
    $this->setImgUrl($img_url);
  }

  // getters
  public function getId():int{
    return $this->id;
  }
  public function getQuantity():int{
    return $this->quantity;
  }
  public function getUnity():string{
    return $this->unity;
  }
  public function getName():string{
    return $this->name;
  }
  public function getImgUrl():?string{
    return $this->img_url;
  }

  // setters
  public function setQuantity(int $quantity):self{
    $this->quantity = $quantity;
    return $this;
  }
  public function setUnity(string $unity):self{
    $this->$unity = $unity;
    return $this;
  }
  public function setName(string $name):self{
    $this->$name = $name;
    return $this;
  }
  public function setImgUrl(string $img_url):self{
    $this->$img_url = $img_url;
    return $this;
  }
}