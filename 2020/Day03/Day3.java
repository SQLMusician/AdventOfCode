package com.sbaars.adventofcode.year20.days;

import com.sbaars.adventofcode.common.ReadsFormattedString;
import com.sbaars.adventofcode.year20.Day2020;
import lombok.Data;
import lombok.Value;

import java.io.IOException;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static java.lang.Math.toIntExact;

public class Day3 extends Day2020 implements ReadsFormattedString {
    public static void main(String[] args) throws IOException {
        new Day3().printParts();
    }

    public Day3(){super(3);}

    @Override
    public Object part1() throws IOException {
        return trees(dayGrid(), 3, 1);
    }

    @Override
    public Object part2() throws IOException {
        char[][] g = dayGrid();
        return trees(g,1,1) * trees(g,3,1) * trees(g,5,1) * trees(g,7,1) * trees (g,1,2);
    }

    int trees(char[][] grid, int x, int y){
        int trees = 0;
        for(int i = 0;  i < grid.length; i+=y){
            if(grid[i][i*x%grid[0].length] == '#'){
                trees++;
            }
        }
        return trees;
    }
}
