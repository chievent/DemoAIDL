package me.chievent.demoaidl;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

public class RemoteService extends Service {

    private final List<Book> mBookList = new ArrayList<>();

    private final IBookManager mBinder = new IBookManager.Stub() {

        final RemoteCallbackList<IBookCallback> mRemoteCallbackList = new RemoteCallbackList<>();

        @Override
        public List<Book> getBookList() throws RemoteException {
            Log.d("DemoAIDL", "RemoteService, getBookList");
            return mBookList;
        }

        @Override
        public void addBook(Book book) throws RemoteException {
            Log.d("DemoAIDL", "RemoteService, addBook");
            mBookList.add(book);
            int i = mRemoteCallbackList.beginBroadcast();
            while (i > 0) {
                i--;
                try {
                    // NOTE: 这里不能用 mRemoteCallbackList.getRegisteredCallbackItem(i)，它是线程不安全的
                    mRemoteCallbackList.getBroadcastItem(i).onBookAdded(book);
                } catch (RemoteException e) {
                    Log.d("DemoAIDL", "RemoteService", e);
                }
            }
            mRemoteCallbackList.finishBroadcast();
        }

        @Override
        public void registerListener(IBookCallback callback) throws RemoteException {
            mRemoteCallbackList.register(callback);
        }

        @Override
        public void unregisterListener(IBookCallback callback) throws RemoteException {
            mRemoteCallbackList.unregister(callback);
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
