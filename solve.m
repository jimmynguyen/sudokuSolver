function board = solve(board)
    board = solveHelper(board,'NakedSingle');
end

function board = solveHelper(board,algorithm)

    if false == isSolved(board)

        switch algorithm
            case 'NakedSingle'
                board = findNakedSingle(board);
                board = solveHelper(board,'HiddenSingle');
            case 'NakedPairs'
                [board,isNakedPairsFound] = findNakedPairs(board);
                if isNakedPairsFound
                    board = solveHelper(board,'NakedSingle');
                end
            case 'HiddenSingle'
                board = findHiddenSingle(board);
                board = solveHelper(board,'NakedPairs');
        end

    end

end