package me.chievent.demoaidl;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

public class RemoteService extends Service {

    private final List<Book> mBookList = new ArrayList<>();

    private final IBookManager mBinder = new IBookManager.Stub() {

        @Override
        public List<Book> getBookList() throws RemoteException {
            Log.d("DemoAIDL", "RemoteService, getBookList");
            return mBookList;
        }

        @Override
        public void addBook(Book book) throws RemoteException {
            Log.d("DemoAIDL", "RemoteService, addBook");
            mBookList.add(book);
        }
    };

    public RemoteService() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        Log.d("DemoAIDL", "RemoteService, onBind");
        return mBinder.asBinder();
    }
}
