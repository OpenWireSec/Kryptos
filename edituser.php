<?php
require_once 'core/Init.php';

$user = new User();
if (isset($_GET["id"])) {
    $id = preg_replace('/[^-a-zA-Z0-9_]/', '', $_GET['id']);
}

if (!isset($id) || $id != $user->data()->id) {
    Redirect::to('index.php');
}

if($user->isLoggedIn()) {
    if(Input::exists()) {
        $validate = new Validate();
        $passwordValidate = $validate->check($_POST, array(
            'password_again' => array(
                'required' => true,
                'matches' => 'password'
            )
        ));
        if($passwordValidate->passed()) {
            $salt = Hash::salt(32);
            $update = DB::getInstance()->update('users', $id, array(
                'password' => Hash::make(Input::get('password'), $salt),
                'salt' => $salt
            ));
            Redirect::to('index.php');

        }
    }

    $page = new Page;
    $page->setTitle('Edit Account');
    $page->startBody();
    echo $page->render('includes/menu.php');

    ?>
    <div class="panel panel-primary">

        <div class="panel-heading">
            <div class="panel-title">Edit Password</div>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
            </div>
        </div>

        <div class="panel-body">

            <form role="form" id="form1" method="post" class="validate">

                <div class="form-group">
                    <label class="control-label">New Password</label>
                    <input type="password" class="form-control" name="password" id="password" data-validate="required" data-message-required="Password is Required" placeholder="Password" />
                </div>

                <div class="form-group">
                    <label class="control-label">New Password Again</label>
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