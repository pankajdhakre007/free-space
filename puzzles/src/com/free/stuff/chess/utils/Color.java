package com.free.stuff.chess.utils;

public enum Color {
    BLACK,
    WHITE;

    public Color getOpposite() {
        return this == BLACK ? WHITE : BLACK;
    }

}
