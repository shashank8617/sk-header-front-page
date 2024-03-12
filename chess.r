package Programm;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

public class MeetingPointFinder {
    public static int[] findMeetingPoint(int[][] grid, int[] horsePosition, int[] bishopPosition) {
        int rows = grid.length;
        int cols = grid[0].length;

        Set<String> visited = new HashSet<>();
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{horsePosition[0], horsePosition[1], bishopPosition[0], bishopPosition[1]});

        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int horseX = current[0];
            int horseY = current[1];
            int bishopX = current[2];
            int bishopY = current[3];

            if (horseX == bishopX && horseY == bishopY) {
                return new int[]{horseX, horseY};
            }

            int[][] moves = {{2, 1}, {2, -1}, {-2, 1}, {-2, -1}, {1, 2}, {-1, 2}, {1, -2}, {-1, -2}};

            for (int[] move : moves) {
                int newHorseX = horseX + move[0];
                int newHorseY = horseY + move[1];

                if (isValid(newHorseX, newHorseY, rows, cols, grid) &&
                        !visited.contains(newHorseX + "," + newHorseY + "," + bishopX + "," + bishopY)) {
                    visited.add(newHorseX + "," + newHorseY + "," + bishopX + "," + bishopY);
                    queue.offer(new int[]{newHorseX, newHorseY, bishopX, bishopY});
                }
            }

            int[][] bishopMoves = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}};

            for (int[] move : bishopMoves) {
                int newBishopX = bishopX + move[0];
                int newBishopY = bishopY + move[1];

                if (isValid(newBishopX, newBishopY, rows, cols, grid) &&
                        !visited.contains(newBishopX + "," + newBishopY + "," + horseX + "," + horseY)) {
                    visited.add(newBishopX + "," + newBishopY + "," + horseX + "," + horseY);
                    queue.offer(new int[]{horseX, horseY, newBishopX, newBishopY});
                }
            }
        }

        return null;
    }

    private static boolean isValid(int x, int y, int rows, int cols, int[][] grid) {
        return x >= 0 && x < rows && y >= 0 && y < cols && grid[x][y] == 0;
    }

    public static void main(String[] args) {
        int[][] grid = {
                {1, 1, 1, 1, 0, 1, 1},
                {1, 1, 1, 1, 1, 1, 1},
                {0, 1, 1, 1, 1, 1, 1},
                {1, 1, 1, 1, 1, 1, 1},
                {1, 1, 1, 0, 1, 1, 1},
                {1, 1, 1, 1, 1, 1, 1}
        };

        int[] horsePosition = {6, 6};
        int[] bishopPosition = {3, 2};

        int[] result = findMeetingPoint(grid, horsePosition, bishopPosition);

        if (result != null) {
            System.out.println("The animals can meet at position: " + result[0] + ", " + result[1]);
        } else {
            System.out.println("No meeting point found.");
        }
    }
}
