<?php

/**
 * Define your application's services, models and factories.
 * @link http://nailsapp.co.uk/docs/services
 */

return array(


    /**
     * Classes/libraries which don't necessarily relate to a database table.
     * Once instantiated, a request for a service will always return the same instance.
     */
    'services' => array(
        // 'ModelName' => function () {
        //    return new \App\Service\ModelName();
        //}
    ),


    /**
     * Models generally represent database tables.
     * Once instantiated, a request for a model will always return the same instance.
     */
    'models' => array(
        // 'ModelName' => function () {
        //    return new \App\Model\ModelName();
        //}
    ),


    /**
     * A class for which a new instance is created each time it is requested.
     */
    'factories' => array(
        // 'FactoryName' => function () {
        //    return new \App\Factory\FactoryName();
        //}
    )
);
