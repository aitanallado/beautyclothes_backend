package entitieslayer

class ShippingAddress: EntityBase() {

    var addressLine1: String? = ""

    var addressLine2: String? = ""

    var city: String? = ""

    var postalCode: String? = ""

    var phone:String? = ""

    var province: Province? = null

    var country: Country? = null

    var user: User? = null

}