<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio | Info</title>
</head>

<body>
    <table>
        <tr>
            <td>NOMBRE DE LA CIUDAD</td>
            <td>ESTATUS DE LA CIUDAD</td>
            <td>FK ESTADO</td>
        </tr>
        <tr>
            <?php
            include 'conexion.php';
            $consulta = mysqli_query($mysqli, "SELECT * FROM ciudad");

            while ($row = mysqli_fetch_array($consulta)) {
                echo "tr";
                echo "<td>" . $row['nombre_ciudad'] . "</td>";
                echo "<td>" . $row['estatus_ciudad'] . "</td>";
                echo "<td>" . $row['fk_estado'] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
            ?>
        </tr>
    </table>
</body>

</html>