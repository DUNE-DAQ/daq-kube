# Kakfa server guidelines

As the kakfa broker is going to be used by monitoring and control, we are going to use this document to lay down a few rules on how to use the system and not interfere with each other

## Topic naming scheme
Topic shall be named using the following notation
 - topic name should start with the domain, i.e. ``monitoring`` or ``control`` followed by a ``.``, after that the naming scheme is controlled by the individual subgroups. 
