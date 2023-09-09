@section scripts {

        $(document).ready(function () {
          
            $(".ele").on("input", function () {
                const input = $(this);
                const errorSpan = input.next(".text-danger");
                if (input.val().trim() === "") {
                    errorSpan.text(input.attr("data-val-required"));
                } else {
                    errorSpan.text(""); 
                }
            });


        $(".clkbtn").on("click", function (event) {
            
            event.preventDefault();

        $(".ele").each(function () {
                    const input = $(this);
        const errorSpan = input.next(".text-danger");
        if (input.val().trim() === "") {
            errorSpan.text(input.attr("data-val-required"));
                    } else {
            errorSpan.text(""); 
                    }
                });

                const errorsPresent = $(".text-danger:visible").length > 0;

        if (!errorsPresent) {
           
            $("form").submit();
                }
            });
        });
 
}
