.. spelling:word-list::

    SDL_net

.. index:: networking ; SDL_net

.. _pkg.SDL_net:

SDL_net
=======

-  `Official <https://www.libsdl.org/projects/SDL_net/>`__
-  `Hunterized <https://github.com/cpp-pm/SDL_net>`__
-  `Example <https://github.com/cpp-pm/hunter/blob/master/examples/SDL_net/CMakeLists.txt>`__
-  Added by `drodin <https://github.com/drodin>`__ (`pr-452 <https://github.com/cpp-pm/hunter/pull/452>`__)

.. code-block:: cmake

    hunter_add_package(SDL_net)
    find_package(SDL_net CONFIG REQUIRED)
    #...
    target_link_libraries(foo SDL_net::SDL_net)
