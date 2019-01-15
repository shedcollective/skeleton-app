<?php

namespace App\Tests;

// use Nails\Factory;

class Bootstrap
{
    // public static $oUserSuper;
    // public static $oUserAdmin;
    // public static $oUserMember;

    // --------------------------------------------------------------------------

    /**
     * Set up the app's testing environment. This method will be called before any
     * tests have been run, use it to configure anything that needs to be available
     * throughout all the tests (e.g. create some users).
     *
     * Remember that database manipulations which happen here will persist during,
     * and after, the tests – so remember to clean up in the tearDown() method.
     */
    public static function setUp()
    {
        // $oUserModel          = Factory::model('User', 'nails/module-auth');
        // static::$oUserSuper  = $oUserModel->create(
        //     [
        //         'group_id'   => 1,
        //         'first_name' => 'Test',
        //         'last_name'  => 'Super',
        //         'email'      => 'super@test.com',
        //         'password'   => 'password123',
        //     ],
        //     false
        // );
        // static::$oUserAdmin  = $oUserModel->create(
        //     [
        //         'group_id'   => 2,
        //         'first_name' => 'Test',
        //         'last_name'  => 'Admin',
        //         'email'      => 'admin@test.com',
        //         'password'   => 'password123',
        //     ],
        //     false
        // );
        // static::$oUserMember = $oUserModel->create(
        //     [
        //         'group_id'   => 3,
        //         'first_name' => 'Test',
        //         'last_name'  => 'User',
        //         'email'      => 'user@test.com',
        //         'password'   => 'password123',
        //     ],
        //     false
        // );
    }

    // --------------------------------------------------------------------------

    /**
     * Tear down the app's testing environment
     */
    public static function tearDown()
    {
        // $oUserModel = Factory::model('User', 'nails/module-auth');
        // $oUserModel->delete(static::$oUserSuper->id);
        // $oUserModel->delete(static::$oUserAdmin->id);
        // $oUserModel->delete(static::$oUserMember->id);
    }
}
