<?php require "../../config/config.php"; ?>
<?php require "../../libs/App.php";?>
<?php require "../layouts/header.php";?>
<?php 

    $query = "SELECT * FROM orders";
    $app = new App;
    $app->validateSessionAdminInside();

    $orders = $app->selectAll($query);

?>

      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title mb-4 d-inline">Orders</h5>
            
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">id</th>
                    <th scope="col">name</th>
                    <th scope="col">email</th>
                    <th scope="col">town</th>
                    <th scope="col">Country</th>
                    <!-- <th scope="col">zipcode</th> -->
                    <th scope="col">phone_number</th>
                    <th scope="col">address</th>
                    <th scope="col">total_price</th>
                    <th scope="col">status_verify</th>


                    <th scope="col">status</th>
                    <th scope="col">delete</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach($orders as $order) : ?>
                      <tr>
                        <th scope="row"><?php echo $order->id; ?></th>
                         <td><?php echo $order->name; ?></td>
                         <td><?php echo $order->email; ?></td>
                         <td><?php echo $order->Town; ?></td>

                         <td><?php echo $order->Country; ?></td>
                         <!-- <td><?php echo $order->Zipcode; ?></td> -->
                         <td><?php echo $order->Phone_number; ?></td>
                         <td><?php echo $order->Address; ?> </td>
                         <td>$<?php echo $order->total_price; ?></td>
                         <td><?php echo $order->status; ?></td>

                         <td><a href="status.php?id=<?php echo $order->id; ?>" class="btn btn-primary  text-center ">status</a></td>
                         <td><a href="delete-orders.php?id=<?php echo $order->id; ?>" class="btn btn-danger  text-center ">delete</a></td>
                      </tr>
                  <?php endforeach; ?>
                
                </tbody>
              </table> 
            </div>
          </div>
        </div>
      </div>


<?php require "../layouts/footer.php";?>
