#ifndef REFERENCE_COUNTED_HPP
#define REFERENCE_COUNTED_HPP



class RefCounted
{
    private:

        int m_RefCount;

    public:

                RefCounted();
        virtual ~RefCounted();

        int  RefCount() const;
        void IncRef();
        void DecRef();

};

////////////////////////////////////////////////////////////////////////////////
inline
RefCounted::RefCounted()
           : m_RefCount(0)
{
}

////////////////////////////////////////////////////////////////////////////////
inline
RefCounted::~RefCounted()
{
}

////////////////////////////////////////////////////////////////////////////////
inline int
RefCounted::RefCount() const
{
    return m_RefCount;
}

////////////////////////////////////////////////////////////////////////////////
inline void
RefCounted::IncRef()
{
    ++m_RefCount;
}

////////////////////////////////////////////////////////////////////////////////
inline void
RefCounted::DecRef()
{
    --m_RefCount;
}




#endif





