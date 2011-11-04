(function($){
    $.fn.extend({ 
        swap: function(swap_elem) {
            var obj = $(swap_elem);
            var oparent = obj.parent();
            var oindex = obj.index();
            var tindex = this.index();

            if (oindex == tindex && oparent.toString() == this.parent().toString())
                return;

            if (oindex < tindex)
            {
                obj.insertBefore(this);
                this.insertBefore(oparent.children()[oindex]);
            }
            else
            {
                obj.insertAfter(this);
                this.insertAfter(oparent.children()[oindex]);
            }
        }
    });
})(jQuery);
