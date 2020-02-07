class Solution {
public:
    bool exist(vector<vector<char>>& board, string word) {
        int i = 0;
        vector<pair<int,int>> starts;
        for(int B = 0; B < board.size(); B++ ){
            for(int C = 0; C < board[B].size(); C++){
                if(board[B][C] == word[0]){
                    starts.push_back(make_pair(B,C));
                }
            }
        } 
        for( pair<int,int> p : starts){
            map <pair<int,int>, bool> used;
            int b = p.first;
            int c = p.second;
            i=0;
            for( int W = 0; W < word.size(); W++){
                if(board[b][c] == word[W] && !used[make_pair(b,c)]){
                        i++;
                        used[make_pair(b,c)] = true;
                        if( i == word.size()){
                            return true;
                        }
                }
                else if(b > 0 && board[b-1][c] == word[W] && !used[make_pair(b-1,c)]){
                        i++;
                        used[make_pair(b-1,c)] = true;
                        b--;
                        if( i == word.size()){
                            return true;
                        }
                }
                else if(b < board.size()-1 && board[b+1][c] == word[W] && !used[make_pair(b+1,c)]){
                        i++;
                        used[make_pair(b+1,c)] = true;
                        b++;
                        if( i == word.size()){
                             return true;
                        }
                }
                else if(c > 0 && board[b][c-1] == word[W] && !used[make_pair(b,c-1)]){
                        i++;
                        used[make_pair(b,c-1)] = true;
                        c--;
                        if( i == word.size()){
                            return true;
                        }
                }
                else if(c < board[b].size()-1 && board[b][c+1] == word[W] && !used[make_pair(b,c+1)]){
                        i++;
                        used[make_pair(b,c+1)] = true;
                        c++;
                        if( i == word.size()){
                            return true;
                        }
                }
            }
        }
        return false;
    }
};
