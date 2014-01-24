<?php

class Ldap {
    public function connect($username, $password, $server) {
        $ldaprdn  = $username;
        $ldappass = $password;

        $ldapconn = ldap_connect($server)
        or die("Could not connect to LDAP server.");

        if ($ldapconn) {
            $ldapbind = ldap_bind($ldapconn, $ldaprdn, $ldappass);

            if ($ldapbind) {
                return true;
            } else {
                return false;
            }

        }
    }
}