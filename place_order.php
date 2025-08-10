<?php
require_once 'config/config.php'; // Database connection
require_once 'libs/App.php';    // App functions

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name    = $_POST['name'];
    $email   = $_POST['email'];
    $address = $_POST['address'];
    $order   = $_POST['order_items'];

    // Save order in database
    $stmt = $conn->prepare("INSERT INTO orders (name, email, address, order_items) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $name, $email, $address, $order);
    $stmt->execute();

    // Send email to customer
    $to = $email;
    $subject = "Order Confirmation";
    $message = "<h2>Hi $name,</h2><p>Thanks for your order: $order</p><p>Delivery to: $address</p>";
    $headers = "MIME-Version: 1.0\r\nContent-type:text/html;charset=UTF-8\r\nFrom: My Restaurant <no-reply@myrestaurant.com>";
    mail($to, $subject, $message, $headers);

    // Send email to restaurant
    $admin_email = "restaurant@example.com";
    mail($admin_email, "New Order", "New order from $name: $order", $headers);

    echo "Order placed successfully!";
}
?>
