Grace-Phix
==========

A graphics library for the Grace programming language, using GTK and Javascript backend.

Currently to run on GTK, this is required:

- Grace gtk bindings written by Michael Homer: https://github.com/mwh/grace-gtk
  Follow the build instructions, and note that grace-phix only works on GTK+3

- After building, copy these files into grace-gtk/

        grace-phix/gtk/*
        grace-phix/util/GMath.grace
        grace-phix/util/Color.grace
        grace-phix/util/Vector2.grace

- Now any test files that import graphics.grace can be compiled and executed in grace-gtk/

There are some test files in grace-phix/testing
