<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$category = $_GET['category'];
echo "Category: " . $category;
$filteredData = shell_exec('Rscript filter_org_data.R ' . escapeshellarg($category));
header('Content-Type: application/json');
echo $filteredData;
?>