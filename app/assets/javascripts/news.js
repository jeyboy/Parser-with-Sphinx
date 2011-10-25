function sendComment(path, user, message, news_id)
{
    $.ajax( {
                type : 'POST',
                url : path,
                data :{'comment_attr' : {'user' : user, 'message' : message, 'news_id' : news_id}},
                success: function(response){
                     if (response.state)
                     {
                         $('#comment_attr_message').val("");
                         $('#comments').append(response.content);
                     }
                }
            }
    );
}

function sendRating(elem, news_id, user_id)
{
    var childs = $(elem).parent().children();
    var under = true;
    var gem = 1;

    for(var l = 0;l < childs.length - 1; l++)
    {
        if (under)
            $(childs[l]).addClass('check_ruby').removeClass('uncheck_ruby');
        else
            $(childs[l]).addClass('uncheck_ruby').removeClass('check_ruby');

        if (under)
        {
            under = (childs[l] != elem);
            gem=l+1;
        }

    }

    $.ajax({
        type : 'GET',
        data : {'rating_attr' : {'user_id' : user_id, 'news_id' : news_id, 'gems' : gem}},
        url  : "/newses/change_rating",
        success: function (response) {
           if (response.state)
           {

           }
        }
    });
}
