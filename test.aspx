<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<script src="/Scripts/autocomplete/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/autocomplete/jquery.autocomplete.js"></script>
<link href="/Scripts/autocomplete/jquery.autocomplete.css" type="text/css" rel="Stylesheet" />
<script type="text/javascript">
    $(document).ready(function () {
        var acOptions =
    {
        minChars: 1,
        max: 100,
        dataType: 'json',
        extraParams: { format: 'json' },
        parse: function (data) {
            var parsed = [];
            for (var i = 0; i < data.length; i++) {
                parsed[parsed.length] =
                {
                    data: data[i],
                    value: data[i].username,
                    result: data[i].username
                };
            }
            return parsed;
        },
        formatItem: function (item) {
           return (item.username);
        }
    };
        var r = Math.random();
        $("#test").autocomplete("/Home/getdate?r=" + r + "", acOptions);
    }); 
</script>
</head>
<body>
    <div>
    <input type="text" id="test" />    
    </div>
</body>
</html>
