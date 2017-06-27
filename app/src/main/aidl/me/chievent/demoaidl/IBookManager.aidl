// IBookManager.aidl
package me.chievent.demoaidl;

import me.chievent.demoaidl.Book;
import me.chievent.demoaidl.IBookCallback;

interface IBookManager {
    List<Book> getBookList();
    void addBook(in Book book);
    void registerListener(IBookCallback callback);
    void unregisterListener(IBookCallback callback);
}

///*
// * This file is auto-generated.  DO NOT MODIFY.
// */
//package me.chievent.demoaidl;
//
//public interface IBookManager extends android.os.IInterface {
//    /**
//     * Local-side IPC implementation stub class.
//     */
//    public static abstract class Stub extends android.os.Binder implements me.chievent.demoaidl.IBookManager {
//        private static final java.lang.String DESCRIPTOR = "me.chievent.demoaidl.IBookManager";
//
//        /**
//         * Construct the stub at attach it to the interface.
//         */
//        public Stub() {
//            this.attachInterface(this, DESCRIPTOR);
//        }
//
//        /**
//         * 用于将服务端的 Binder 对象转换成客户端所需的 AIDL 接口类型的对象,
//         * 这种转换过程是区分进程的, 如果客户端和服务端位于同一进程, 此方法返回的就是服务端的 Stub 对象本身, 否则返回的是系统封装后的 Stub.Proxy 对象.
//         * Cast an IBinder object into an me.chievent.demoaidl.IBookManager interface,
//         * generating a proxy if needed.
//         */
//        public static me.chievent.demoaidl.IBookManager asInterface(android.os.IBinder obj) {
//            if ((obj == null)) {
//                return null;
//            }
//            android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
//            if (((iin != null) && (iin instanceof me.chievent.demoaidl.IBookManager))) {
//                return ((me.chievent.demoaidl.IBookManager) iin);
//            }
//            return new me.chievent.demoaidl.IBookManager.Stub.Proxy(obj);
//        }
//
//        @Override
//        public android.os.IBinder asBinder() {
//            return this;
//        }
//
//        /**
//         * 此方法运行在服务端的 Binder 线程池中, 当客户端发起进程请求时, 远程请求会通过系统底层封装后交由此方法来处理.
//         * 如果此方法返回 false, 那么客户端请求会失败, 因此我们可以利用这个特性来做权限验证, 保证我们的进程不会被任意进程都能远程调用.
//         * NOTE: 由于服务端的 Binder 运行在 Binder 线程池, 所以服务端不需要另开线程.
//         */
//        @Override
//        public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException {
//            switch (code) {
//                case INTERFACE_TRANSACTION: {
//                    reply.writeString(DESCRIPTOR);
//                    return true;
//                }
//                case TRANSACTION_getBookList: {
//                    data.enforceInterface(DESCRIPTOR);
//                    java.util.List<me.chievent.demoaidl.Book> _result = this.getBookList();
//                    reply.writeNoException();
//                    reply.writeTypedList(_result);
//                    return true;
//                }
//                case TRANSACTION_addBook: {
//                    data.enforceInterface(DESCRIPTOR);
//                    me.chievent.demoaidl.Book _arg0;
//                    if ((0 != data.readInt())) {
//                        _arg0 = me.chievent.demoaidl.Book.CREATOR.createFromParcel(data);
//                    } else {
//                        _arg0 = null;
//                    }
//                    this.addBook(_arg0);
//                    reply.writeNoException();
//                    return true;
//                }
//            }
//            return super.onTransact(code, data, reply, flags);
//        }
//
//        /**
//         * 定义了接口 IBookManager 方法的具体实现, 运行在客户端
//         * NOTE: 远程调用时, 客户端线程会挂起, 所以不要在主线程中进行耗时的远程操作
//         */
//        private static class Proxy implements me.chievent.demoaidl.IBookManager {
//            private android.os.IBinder mRemote;
//
//            Proxy(android.os.IBinder remote) {
//                mRemote = remote;
//            }
//
//            @Override
//            public android.os.IBinder asBinder() {
//                return mRemote;
//            }
//
//            public java.lang.String getInterfaceDescriptor() {
//                return DESCRIPTOR;
//            }
//
//            @Override
//            public java.util.List<me.chievent.demoaidl.Book> getBookList() throws android.os.RemoteException {
//                android.os.Parcel _data = android.os.Parcel.obtain();
//                android.os.Parcel _reply = android.os.Parcel.obtain();
//                java.util.List<me.chievent.demoaidl.Book> _result;
//                try {
//                    _data.writeInterfaceToken(DESCRIPTOR);
//                    // 调用 IBinder 的 transact 方法来发起 RPC (远程过程调用) 请求, 同时当前线程挂起.
//                    // 然后服务端的 onTransact 方法会被调用
//                    mRemote.transact(Stub.TRANSACTION_getBookList, _data, _reply, 0);
//                    // RPC 过程返回后, 客户端线程继续执行, 从 _reply 中取出结果, 最后返回 _reply 中的数据.
//                    _reply.readException();
//                    _result = _reply.createTypedArrayList(me.chievent.demoaidl.Book.CREATOR);
//                } finally {
//                    _reply.recycle();
//                    _data.recycle();
//                }
//                return _result;
//            }
//
//            @Override
//            public void addBook(me.chievent.demoaidl.Book book) throws android.os.RemoteException {
//                android.os.Parcel _data = android.os.Parcel.obtain();
//                android.os.Parcel _reply = android.os.Parcel.obtain();
//                try {
//                    _data.writeInterfaceToken(DESCRIPTOR);
//                    if ((book != null)) {
//                        _data.writeInt(1);
//                        book.writeToParcel(_data, 0);
//                    } else {
//                        _data.writeInt(0);
//                    }
//                    mRemote.transact(Stub.TRANSACTION_addBook, _data, _reply, 0);
//                    _reply.readException();
//                } finally {
//                    _reply.recycle();
//                    _data.recycle();
//                }
//            }
//        }
//
//        static final int TRANSACTION_getBookList = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
//        static final int TRANSACTION_addBook = (android.os.IBinder.FIRST_CALL_TRANSACTION + 1);
//    }
//
//    public java.util.List<me.chievent.demoaidl.Book> getBookList() throws android.os.RemoteException;
//
//    public void addBook(me.chievent.demoaidl.Book book) throws android.os.RemoteException;
//}
