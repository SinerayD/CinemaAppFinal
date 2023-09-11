"use strict"

$(function () {

    $(document).on('click', '#deleteBtn', function () {
        var id = $(this).data('id')
        var basketCount = $('#basketCount')
        var basketCurrentCount = $('#basketCount').html()
        var id = $(this).data('id');
        var quantity = $(this).data('quantity')
        var sum = basketCurrentCount - quantity


        $.ajax({
            method: 'POST',
            url: "/basket/deleteall",
            data: {
                id: id
            },
            success: function (res) {

                Swal.fire({
                    icon: 'success',
                    title: 'Product deleted',
                    showConfirmButton: false,
                    timer: 1500
                })

                $(`.basket-product[id=${id}]`).remove();
                basketCount.html("")
                basketCount.append(sum)

            }
        })

    });

    $(document).on('click', '#minus-basket', function () {
        var id = $(this).closest('tr').attr('id');
        var quantityElement = $(this).siblings('.product-count');
        var currentQuantity = parseInt(quantityElement.text());

        if (currentQuantity > 1) {
            currentQuantity--;

            $.ajax({
                method: 'POST',
                url: "/basket/delete",
                data: {
                    id: id
                },
                success: function () {
                    Swal.fire({
                        icon: 'success',
                        title: 'One Movie deleted',
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            });
        } else {

            $.ajax({
                method: 'POST',
                url: "/basket/delete",
                data: {
                    id: id
                },
                success: function () {
                    Swal.fire({
                        icon: 'success',
                        title: 'Movie deleted',
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            });
            $(this).closest('tr').remove();
        }

        quantityElement.text(currentQuantity);
    });

    $(document).on('click', '#plus-basket', function () {
        var id = $(this).closest('tr').attr('id');
        var quantityElement = $(this).siblings('.product-count');
        var currentQuantity = parseInt(quantityElement.text());

        currentQuantity++;

        quantityElement.text(currentQuantity);

        $.ajax({
            method: 'POST',
            url: "/basket/PlusAdd",
            data: {
                id: id,
                quantity: currentQuantity

            },
            success: function () {
                Swal.fire({
                    icon: 'success',
                    title: 'One Movie Add',
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        });
    });

});