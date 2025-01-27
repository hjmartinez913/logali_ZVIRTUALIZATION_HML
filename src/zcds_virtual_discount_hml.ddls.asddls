@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element- Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_virtual_discount_hml
  as select from /dmo/flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}
