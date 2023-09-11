"use strict"
$(function () {
    $(document).on("click", "#addToCart", function () {

        let id = $(this).attr('cart-id');

        $.ajax({
            method: "POST",
            url: "/basket/addbasket",
            data: {
                id: id
            },
            content: "application/x-www-from-urlencoded",
            success: function (res) {
                Swal.fire({
                    icon: 'success',
                    title: 'Product added',
                    showConfirmButton: false,
                    timer: 1500,
                })


            }

        });

    });
});