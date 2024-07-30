<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form name="std"  action="register.php" method="post">
         <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id"/></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <input type="text" name="name"/>
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <input type="text" name="phone"/>
                </td>
            </tr>
            <tr>
                <td>Dept:</td>
                <td>
                    <input type="text" name="dept"/>
                </td>
            </tr>
            <tr>
                <td >
                    <input type="submit" name="save"/>
                </td>
                <td >
                    <input type="submit" value="Delete" name="delete"/>
                </td>
            </tr>
         </table>

    </form>
</body>
</html>