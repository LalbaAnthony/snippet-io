<?php

function rand_color()
{
    return sprintf('#%06X', mt_rand(0, 0xFFFFFF));
}