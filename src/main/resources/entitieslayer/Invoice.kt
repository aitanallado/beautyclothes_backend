package entitieslayer

class Invoice: EntityBase() {

    var dateTimeInvoice: Date? = null

    var  user: User? = null

    var paymentMethod: PaymentMethod? = null

}