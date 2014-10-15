# SSH Setup

For deploying to a server, you need:

* To be able to login to the server over SSH
* And do the same *without a password* for automatic depoyments

For password-less secure SSH - we need a public/private SSH key. If you have username/password - here is how to convert that into a public/private key combination:

    # Generate the keys (if asked for passphrase, leave it empty)
    $ ssh-keygen -t rsa -f my_server

    $ ls               # check if the keys are generated
    my_server          # this is the private key
    my_server.pub      # this is the public key

    # Now that the keys are generated, copy them to the server using your username/password:
    ssh-copy-id -i my_server <username>@<server.com>
    password:          # enter your password when asked
    (1) keys copied    # check this message

    # Now check if you can login without a password:
    ssh -i my_server <username>@<server.com>

    # You should be logged in without asking for any password

The `my_server` private key file is now what you need to login to the server over SSH without any password. Use this wherever a private key is needed (e.g. the CI).

## Troubleshooting

* Make sure the private key has safe permissions (0600). Sometimes this is the reason for most SSH automatic login failures.
