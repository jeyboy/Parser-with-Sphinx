function sendComment(path, user, message, news_id)
{
    $.ajax( {
                type : 'GET',
                url : path,
                data :{'comment_attr' : {'user' : user, 'message' : message, 'news_item_id' : news_id}},
                success: function(response){
                     if (response.state)
                     {
                         $('#comment_attr_message').val("");
                         $('#comments').append(response.comment);
                     }
                }
            }
    );
}

function sendRating(elem, news_id, user_id)
{
    var childs = $(elem).parent().children();
    var gem = 1;

    for(var l = 0;l < childs.length - 1; l++)
    {
        if (childs[l] == elem)
        {
            gem=l+1;
            break;
        }
    }

    $.ajax({
        type : 'GET',
        data : {'rating_attr' : {'user_id' : user_id, 'news_id' : news_id, 'gems' : gem}},
        url  : "/news_items/change_rating",
        success: function (response) {
           if (response.state)
           {
               for(var l = 0;l < childs.length - 1; l++)
               {
                   if (l<gem)
                       $(childs[l]).addClass('check_ruby').removeClass('uncheck_ruby');
                   else
                       $(childs[l]).addClass('uncheck_ruby').removeClass('check_ruby');
               }
           }
        }
    });
}
