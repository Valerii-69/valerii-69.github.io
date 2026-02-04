<?php
$data = json_decode(file_get_contents("php://input"), true);

$number = intval($data["number"]);   // ← получаем номер
$filename = "./json/fractal_" . $number . "_new.json";  // ← путь

file_put_contents($filename, json_encode($data, JSON_PRETTY_PRINT));

echo "OK";
