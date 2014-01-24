<?php
require_once 'core/Init.php';

$user = new User();

if($user->isLoggedIn()) {
    if(Input::exists()) {
        if(Token::check(Input::get('token'))) {
            $validate = new Validate();
            $validation = $validate->check($_POST, array(
                'username' => array(
                    'required' => true,
                    'min' => 2,
                    'max' => 20,
                    'unique' => 'users'
                ),
                'password' => array(
                    'required' => true,
                    'min' => 6
                ),
                'password_again' => array(
                    'required' => true,
                    'matches' => 'password'
                )
            ));

            if($validation->passed()) {
                $salt = Hash::salt(32);

                try {
                    $user->createUser(array(
                        'username' => Input::get('username'),
                        'password' => Hash::make(Input::get('password'), $salt),
                        'salt' => $salt,
                        'group' => 1
                    ));

                    Redirect::to('index.php');


                } catch(Exception $e) {
                    die($e->getMessage());
                }
            } else {
                foreach($validation->errors() as $errors) {
                    $error = ucfirst($errors);
                    echo '<script type="text/javascript"> alert(\''.$error.'\'); </script>';
                }
            }
        }
    }
    $page = new Page;
    $page->setTitle('Add User');
    $page->startBody();
    ?>


    <div class="panel panel-primary">

        <div class="panel-heading">
            <div class="panel-title">Add a new user</div>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
            </div>
        </div>

        <div class="panel-body">

            <form role="form" id="form1" method="post" class="validate">

                <div class="form-group">
                    <label class="control-label">Username</label>
                    <input type="text" class="form-control" name="username" id="username" data-validate="required" data-message-required="Username is Required" placeholder="Username" />
                </div>

                <div class="form-group">
                    <label class="control-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password" data-validate="required" data-message-required="Password is Required" placeholder="Password" />
                </div>

                <div class="form-group">
                    <label class="control-label">Password Again</label>
                    <input type="password" class="form-control" name="password_again" id="password_again" data-validate="required" data-message-required="Please Re-Enter the Password" placeholder="Password" />
                </div>

                <div class="form-group">
                    <input type="hidden" name="token" value="<?php echo htmlentities(Token::generate()); ?>" />
                    <button type="submit" class="btn btn-success">Add User</button>
                    <button type="reset" class="btn">Reset</button>
                </div>

            </form>

        </div>
    </div>
    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}