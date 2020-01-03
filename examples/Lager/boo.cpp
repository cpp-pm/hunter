//
// lager - library for functional interactive c++ programs
// Copyright (C) 2017 Juan Pedro Bolivar Puente
//
// This file is part of lager.
//
// lager is free software: you can redistribute it and/or modify
// it under the terms of the MIT License, as detailed in the LICENSE
// file located at the root of this source code distribution,
// or here: <https://github.com/arximboldi/lager/blob/master/LICENSE>
//

#include <iostream>
#include <lager/event_loop/manual.hpp>
#include <lager/store.hpp>

#include <lager/util.hpp>

#include <variant>

namespace counter {

struct model
{
    int value = 0;
};

struct increment_action
{};
struct decrement_action
{};
struct reset_action
{
    int new_value = 0;
};

using action = std::variant<increment_action, decrement_action, reset_action>;

inline model update(model c, action action)
{
    return std::visit(lager::visitor{
                          [&](increment_action) { return model{c.value + 1}; },
                          [&](decrement_action) { return model{c.value - 1}; },
                          [&](reset_action a) { return model{a.new_value}; },
                      },
                      action);
}

} // namespace counter
void draw(counter::model prev, counter::model curr)
{
    std::cout << "last value: " << prev.value << '\n';
    std::cout << "current value: " << curr.value << '\n';
}

std::optional<counter::action> intent(char event)
{
    switch (event) {
    case '+':
        return counter::increment_action{};
    case '-':
        return counter::decrement_action{};
    case '.':
        return counter::reset_action{};
    default:
        return std::nullopt;
    }
}

int main()
{
    auto store = lager::make_store<counter::action>(
        counter::model{}, counter::update, lager::with_manual_event_loop{});
    watch(store, draw);

    auto event = char{};
    while (std::cin >> event) {
        if (auto act = intent(event))
            store.dispatch(*act);
    }
}
