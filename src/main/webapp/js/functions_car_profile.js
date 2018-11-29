/**
 * Created by Assou on 29/08/2016.
 */
var  datesDisabledTab = [];
var resultsTable = [];
var currentOrdre = 0;
var currentDays = 0;





// Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;

(function($, window) {
    var Starrr;

    Starrr = (function() {
        Starrr.prototype.defaults = {
            rating: void 0,
            numStars: 5,
            change: function(e, value) {}
        };

        function Starrr($el, options) {
            var i, _, _ref,
                _this = this;

            this.options = $.extend({}, this.defaults, options);
            this.$el = $el;
            _ref = this.defaults;
            for (i in _ref) {
                _ = _ref[i];
                if (this.$el.data(i) != null) {
                    this.options[i] = this.$el.data(i);
                }
            }
            this.createStars();
            this.syncRating();
            this.$el.on('mouseover.starrr', 'span', function(e) {
                return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('mouseout.starrr', function() {
                return _this.syncRating();
            });
            this.$el.on('click.starrr', 'span', function(e) {
                return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
            });
            this.$el.on('starrr:change', this.options.change);
        }

        Starrr.prototype.createStars = function() {
            var _i, _ref, _results;

            _results = [];
            for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
            }
            return _results;
        };

        Starrr.prototype.setRating = function(rating) {
            if (this.options.rating === rating) {
                rating = void 0;
            }
            this.options.rating = rating;
            this.syncRating();
            return this.$el.trigger('starrr:change', rating);
        };

        Starrr.prototype.syncRating = function(rating) {
            var i, _i, _j, _ref;

            rating || (rating = this.options.rating);
            if (rating) {
                for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                    this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                }
            }
            if (rating && rating < 5) {
                for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                    this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            }
            if (!rating) {
                return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
            }
        };

        return Starrr;

    })();
    return $.fn.extend({
        starrr: function() {
            var args, option;

            option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
            return this.each(function() {
                var data;

                data = $(this).data('star-rating');
                if (!data) {
                    $(this).data('star-rating', (data = new Starrr($(this), option)));
                }
                if (typeof option === 'string') {
                    return data[option].apply(data, args);
                }
            });
        }
    });
})(window.jQuery, window);

$(function() {
    return $(".starrr").starrr();
});











$(document).ready(function () {

    ///Get rents/reservations
    //=> disable dates

    //rent/reserve
    //=> send car_id user_id and dates from and to

    //Initialisation : disabling reserved dates


    function get_all_car_rents() {
        $.getJSON('management_get_all_car_rents.json?car_id=1', {
            ajax: 'true'
        }, function (result) {
            var htln = "";
            var date_from_days;
            var date_to_days;
            var diff;
            var currentDisabledDate;
            console.log(result);
            currentOrdre = result.length + 1;
            resultsTable  = result;
            for(var i=0; i<result.length;i++){
                diff = moment(result[i].date_to,"YYYY-MM-DD").diff( moment(result[i].date_from,"YYYY-MM-DD")) ;
                diff = moment.duration(diff).asDays();
                console.log("Diffrence between  from:"+ result[i].date_from +"and to : "+result[i].date_to+" Days :");
                console.log(diff);
                currentDays = diff;

                //datesDisabledTab.push( result[i].date_from );
                for(var j=0;j<=diff ; j++){
                    currentDisabledDate = moment( result[i].date_from ).add(j,"d").format("DD/MM/YYYY");
                    datesDisabledTab.push( currentDisabledDate );
                }

            }
            console.log(datesDisabledTab);
            if( resultsTable.length == 0)
                $("button#modal-rend-btn").css('display','none');

        }).done(function () {
            console.log("apres success");
        }).fail(function () {
                console.log("error");

            }).always(function () {
                console.log("complete toujours succes ou erreur");
            initCalendars();
            });
    }

    get_all_car_rents();


    // Rent Reserve Btn click handling
    $("#modal-rent-btn").click(function() {
        $('#rentModal').modal('show')
    });
    init_payment_card();
    //Buy Btn Click handling
    $("#modal-buy-btn").click(function() {
        $('#buyModal').modal('show')

        //createPaiement();
    });




    $("#modal-rend-btn").click(function() {

        if( resultsTable.length > 0 )
            swal({
                title: "Etes Vous Sure ?",
                text: "Voulez vous vraiment Cloturer la période de location/réservation ? : "+ resultsTable[0].date_from +" -" + resultsTable[0].date_to,
                type: "info",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "Confirmer",
                confirmButtonClass: "btn  btn-success waves-effect",
            }, function () {
                $.ajax(
                    {
                        type: "POST",
                        url: "management_cloture_rent.html",
                        data: {
                            id_rent: resultsTable[0].id ,
                        }
                    }
                )
                    .done(function (data) {
                        if (JSON.parse(data) == "100") {
                            swal("Succès!", "Période de Location/Réservation cloturée", "success");
                            location.reload();
                        }
                    })
                    .error(function (data) {
                        swal("Erreur", "Une erreur survenue, veuillez contacter votre administrateur", "error");
                    });
            });

    });



    function initCalendars() {
        if ($('.date-picker')[0]) {
            $('.date-picker').datepicker({
                format: 'dd/mm/yyyy',
                datesDisabled: datesDisabledTab
            });
        }



    }




    //Date


    $("#rentConfirm").click(function() {
        console.log("Adding Rent");
        createRent();
    });

    $("button#paiementConfirm").click(function () {
            startPaymentProcedure();
    });

    function startPaymentProcedure(){

    }


    function check_valid_interval(date_from, date_to){
            var diffe_inf_from = 0;
            var diffe_inf_to = 0;
            var diffe_sup_from = 0;
            var diffe_sup_to = 0;
            for(var i=0;i<resultsTable.length;i++){
                diffe_inf_from = moment(date_from,"DD/MM/YYYY").diff( moment( resultsTable[i].date_from ,"YYYY-MM-DD"));
                diffe_inf_from = moment.duration(diffe_inf_from ).asDays();
                diffe_inf_to = moment(date_to,"DD/MM/YYYY").diff( moment( resultsTable[i].date_from ,"YYYY-MM-DD"));
                diffe_inf_to  = moment.duration(diffe_inf_to ).asDays();
                diffe_sup_from = moment(date_from,"DD/MM/YYYY").diff( moment( resultsTable[i].date_to,"YYYY-MM-DD"));
                diffe_sup_from = moment.duration(diffe_inf_from ).asDays();
                diffe_sup_to = moment(date_to,"DD/MM/YYYY").diff( moment( resultsTable[i].date_to,"YYYY-MM-DD"));
                diffe_sup_to  = moment.duration(diffe_inf_to).asDays();
                console.log("date from :   "+date_from+"  date to : "+date_to);
                console.log("table date from :   "+resultsTable[i].date_from +"  table date to : "+resultsTable[i].date_to);
                console.log("dif inf from  "+diffe_inf_from+"  dif inf to "+diffe_inf_to+"   dif sup from  "+diffe_sup_from+"   dif sup to  "+diffe_sup_to);

                if( !(   diffe_inf_from < 0 &&   diffe_inf_to < 0 || diffe_sup_from > 0 && diffe_sup_to>0) )
                    return false;

            }
            return true;
    }

    function createRent(){
        var ordre = 1;
        var from_date = $("#rent_date_from").val();
        console.log("in create rent_date_from");
        console.log(from_date);
        var to_date = $("#rent_date_to").val();
        console.log("in create rent_date_to");
        console.log(to_date);


        console.log("Valida intervals :")
        console.log(check_valid_interval(from_date,to_date));


        var nb_days =  moment(to_date,"DD/MM/YYYY").diff( moment(from_date,"DD/MM/YYYY")) ;
        nb_days = moment.duration(nb_days).asDays();
        nb_days++;

        var from_today =  moment(to_date,"DD/MM/YYYY").diff( moment()) ;
        from_today= moment.duration(from_today).asDays();
        from_today++;



        var rent_price = nb_days * car_rent_price;
        console.log("currentOrdre  :");
        console.log(currentOrdre);

        if(check_valid_interval(from_date,to_date) && from_today>0 && nb_days>0){
            $.ajax(
                {
                    type: "POST",
                    url: "management_create_rent.html",
                    data: {
                        date_from: moment(from_date,"DD/MM/YYYY").format("x"),
                        date_to:   moment(to_date,"DD/MM/YYYY").format("x"),
                        days : parseInt(nb_days)    ,
                        ordre:currentOrdre,
                        price: currentDays * car_rent_price,
                        user_id:current_user_id,
                        car_id:current_car_id
                    }
                }
            )
                .done(function (data) {
                    if (JSON.parse(data) == "100"){
                        swal("Succès!", "Véhicule loué", "success");
                        location.reload();
                    }
                    else if(JSON.parse(data) == "101") swal("Erreur", "Location non valable", "error");
                    else swal("Erreur", ""+ data, "error");
                })
                .error(function (data) {
                    swal("Erreur", "Location non valable", "error");
                });
        }else{
            swal("Erreur", "Intervall non autorisé", "error");
        }
    }





    function createPaiement(){
            $.ajax(
                {
                    type: "POST",
                    url: "management_purchase_create.html",
                    data: {
                        user_id:current_user_id,
                        car_id:current_car_id,
                        purchase_price: car_sell_price,
                        purchase_date: moment().format("x")
                    }
                }
            )
                .done(function (data) {
                    if (JSON.parse(data) == "100"){
                        swal("Succès!", "Véhicule Acheté", "success");
                        location.reload();
                    }
                    else if(JSON.parse(data) == "101") swal("Erreur", "Location non valable", "error");
                    else swal("Erreur", ""+ data, "error");
                })
                .error(function (data) {
                    swal("Erreur", "Achat non effectué", "error");
                });
    }




    function init_payment_card(){
        //$("form.myForm").
        var card = new Card({
            form: 'form',
            container: '.card-wrapper',
            formSelectors: {
                nameInput: 'input#payment_prenom' // optional - defaults input[name="name"]
            },
            messages: {
                validDate: 'expire\ndate',
                monthYear: 'mm/yy'
            },placeholders: {
                number: '**** **** **** ****',
                name: 'Flen',
                expiry: '**/****',
                cvc: '***'
            }
        });
    }






});