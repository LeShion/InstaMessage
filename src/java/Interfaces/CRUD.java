
package Interfaces;

import beans.Mensaje;
import java.util.List;

public interface CRUD {
    public List listar();
    public Mensaje list(int id);
    public boolean newM(Mensaje men);
    public boolean delM(Mensaje men);
}
