package pl.mamzdanie.useraddon.svc.service.persistence;

public interface UserAddonFinder {
    public java.lang.String getUserLastName(int id)
        throws com.liferay.portal.SystemException;

    public java.lang.String getUserFirstName(int id)
        throws com.liferay.portal.SystemException;
}
