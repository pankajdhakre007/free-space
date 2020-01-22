package com.free.stuff.chess.utils;

public enum Player {

    ONE(Color.WHITE),
    TWO(Color.BLACK);

    private Color color;

    private Player(Color color) {
        this.color = color;
    }

    public Color getColor() {
        return color;
    }

    public Player getNext() {
        return this == ONE ? TWO : ONE;
    }

}
