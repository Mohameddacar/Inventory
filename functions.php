

<?php
include("conn.php");
// Example of fillCombo function with a database connection parameter
function fillCombo($conn, $query, $valueField, $textField) {
    $result = $conn->query($query);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<option value='" . $row[$valueField] . "'>" . $row[$textField] . "</option>";
        }
    } else {
        echo "<option value=''>No data available</option>";
    }
}
?>