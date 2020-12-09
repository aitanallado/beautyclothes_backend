package entitieslayer

class Product: EntityBase() {

    var productName: String? = null

    var description: String? = null

    var pathImage: javax.json.Json? = null //TODO Review json object

    var priceWithoutTax: Double?  = 0.0

    var quantityStock: Int? = 0

    var isSale: Boolean = false

    var percentageDiscount: Int? = 0

    var categoryProduct: CategoryProduct? = null

}